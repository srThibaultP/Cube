<?php
require_once "./pdo.php";

if (isset($_POST)) {
	if ($_POST["action"] == "create") {
		$query = $pdo->prepare("INSERT INTO `HeureOccupation` (`HeureDebut`, `HeureFin`, `commentaire`) VALUES ( :debut, :fin, :commentaire)");
		$query->execute([
			'debut' => $_POST["start_time"],
			'fin' => $_POST["end_time"],
			'commentaire' => $_POST["comment"]
		]);
	} else if ($_POST["action"] == "delete") {
		$query = $pdo->prepare("DELETE FROM `HeureOccupation` WHERE `ID` = :id");
		$query->execute([
			'id' => $_POST["row_id"]
		]);
	}
}
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">

	<title>Cube SA</title>

	<link href="style/style.css" rel="stylesheet">
	<link rel="icon" type="image/jpg" href="images/logoCubeSA.jpg" />
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />

	<script language="javascript" src="js/horloge.js"></script>
	<script language="javascript" src="js/gestionWEBSOCKET.js"></script>
	<script language="javascript" src="js/dessiner.js"></script>
	<script language="javascript" src="js/modification.js"></script>
	<script src="socket.io/socket.io.js"></script>
	<link href="style/api.css" rel="stylesheet">
</head>

<body onload="gererWS();Clock()">
	<a href="index.php">
		<img class=retour src=images/LogoSN.png alt=LogoSN align=right position=absolute style="width: 100px;" height: 80px />
	</a>

	<nav>
		<br />
		<p id="presentationVille"> Projet CUBE </p>
		<br />
		<a href="index.php">
			<img class=retour src=images/logoCubeSA.jpg alt=LogoSN align=right position=absolute style="width: 55px;" height: 55px /></a>
	</nav>

	<main>
		<form action="" method="POST">
			<label for="start_time">Heure de début</label>
			<input type="time" name="start_time" />
			<br />
			<label for="end_time">Heure de fin</label>
			<input type="time" name="end_time" />
			<br />
			<label for="comment">Commentaire</label>
			<input name="comment" />
			<br />
			<input type="submit" />
			<input type="hidden" name="action" value="create" />
		</form>

		<table>
			<thead>
				<tr>
					<th>Commentaire</th>
					<th>Heure de début</th>
					<th>Heure de fin</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<?php
				$query = $pdo->prepare("SELECT * FROM `HeureOccupation`");
				$query->execute();

				$row = $query->fetchAll();

				if (empty($row)) {
					// print error
				}
				?>
				<?php foreach ($row as $r) { ?>
					<tr>
						<td><?php echo $r["commentaire"] ?></td>
						<td><?php echo $r["HeureDebut"] ?></td>
						<td><?php echo $r["HeureFin"] ?></td>
						<td>
							<form action="" method="POST">
								<input type="hidden" name="action" value="delete" />
								<input type="hidden" name="row_id" value="<?php echo $r["ID"] ?>" />
								<input type="submit" value="Delete" />
							</form>
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>
	</main>

	<footer>
		<nav>
			<p id="presentationVille"> Projet CCF - Supervision chauffe-eau solaire </p>
		</nav>
	</footer>
</body>

</html>
