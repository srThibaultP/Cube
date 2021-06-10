const fs = require('fs') //Module filesystem

// Lecture en Synchrone
  console.log("\n------------------ Lecture des fichiers en SYNCHRONE------------------\n")

// Fichier 100Mo
  console.log("Lecture de 100M : " + new Date())
  var start1 = new Date().getTime(); //Récupération donnée temps de depart
  const fichier1 = fs.readFileSync('MoNodeJs/100M.iso','utf8');
  console.log("Lecture terminee fichier 100M : " + new Date()) // Lecture date fin
  var end = new Date().getTime(); //Récupération donnée de temps de fin
  var time = end - start1; // Temps de fin - temps de depart = temps final
  console.log('Temps d\'execution: ' + time + " ms"); // Affichage temps d'exécution

// Fichier 10Mo
  console.log("Lecture de 10M : " + new Date())
  var start2 = new Date().getTime(); //Récupération donnée temps de depart
  const fichier2 = fs.readFileSync('MoNodeJs/10M.iso','utf8');
  console.log("Lecture terminee fichier 10M : " + new Date()) // Lecture de la date de fin
  var end = new Date().getTime(); //Récupération donnée de temps de fin
  var time = end - start2; // Temps de fin - temps de depart = temps final
  console.log('Temps d\'execution: ' + time + " ms"); // Affichage temps d'execution

// Fichier 1Mo
  console.log("Lecture de 1M : " + new Date())
  var start3 = new Date().getTime(); //Récupération donnée de temps de depart
  const fichier3 = fs.readFileSync('MoNodeJs/1M.iso','utf8');
  console.log("Lecture terminee fichier 1M : " + new Date()) // Lecture de la date de fin
  var end = new Date().getTime(); //Récupération donnée de temps de fin
  var time = end - start3; // Temps de fin - temps de depart = temps final
  console.log('Temps d\'execution: ' + time + " ms"); // Affichage temps d'exécution

// Lecture en Asynchrone
  console.log("\n------------ Lecture des fichiers en ASYNCHRONE -----------------\n")
  var startsync = new Date().getTime(); //Récupération donnée de temps de depart

// Fichier 100Mo
  console.log("Lecture de 100M : ")
    fs.readFile('MoNodeJs/100M.iso', 'utf8' , (err) => { //Lecture fichier 100M.iso avec option err
      if (err) { //Si erreur
        return console.error(err) //Retourne l'affichage de l'erreur
      }
      console.log("Lecture terminee fichier 100M : " + new Date()) // Lecture de la date de fin
      var end = new Date().getTime(); //Récupération donnée temps de fin
      var time = end - startsync; // Temps de fin - temps de depart = temps final
      console.log('Temps d\'execution: ' + time + " ms"); // Affichage temps d'exécution
    })

// Fichier 10Mo
  console.log("Lecture de 10M : ") // Lecture de la date au debut
    fs.readFile('MoNodeJs/10M.iso', 'utf8' , (err) => { //Lecture fichier 10M.iso avec option err

      if (err) { //Si erreur
        return console.error(err) //Retourne l'affichage de l'erreur
      }
      console.log("Lecture terminee fichier 10M : " + new Date()) // Lecture de la date de fin
      var end = new Date().getTime(); //Récupération donnée temps de fin
      var time = end - startsync; // Temps de fin - temps de depart = temps final
      console.log('Temps d\'execution: ' + time + " ms"); // Affichage temps d'execution
    })

// Fichier 1M
  console.log("Lecture de 1M : ") // Lecture de la date au debut
    fs.readFile('MoNodeJs/1M.iso', 'utf8' , (err) => { //lecture fichier 1M.iso avec option err
      if (err) { //si erreur
        return console.error(err) //retourne l'affichage de l'erreur
      }
      console.log("Lecture terminee fichier 1M : " + new Date()) // Lecture de la date de fin
      var end = new Date().getTime(); //Récupération donnée temps de fin
      var time = end - startsync; // Temps de fin - temps de depart = temps final
      console.log('Temps d\'execution: ' + time + " ms"); // Affichage temps d'exécution
    })
