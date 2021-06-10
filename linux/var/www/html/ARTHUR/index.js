
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');

});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

const proxy = require("node-global-proxy").default;

proxy.setConfig({
  http: "http://192.168.10.254:3128",
});
proxy.start();




const prompt = require('prompt-sync')();
const name = prompt('Meeting with ?');
console.log(`Meeting with  ${name}`);
const jour_debut = prompt('Jour debut ?');
console.log(`Jour debut =  ${jour_debut}`);
const jour_fin = prompt('Jour fin?');
console.log(`Jour fin =  ${jour_fin}`);
const duree_min = prompt('Duree Min?');
console.log(`Duree min =  ${duree_min}`);

const { google } = require('googleapis')

// Require oAuth2 from our google instance.
const { OAuth2 } = google.auth
const { auth } = google.auth



// Create a new instance of oAuth and set our Client ID & Client Secret.
const oAuth2Client = new OAuth2(
  '1075997679544-ogtm1pckldfcu1ghf7nldtrh5el3hf1u.apps.googleusercontent.com',
  'dxk0V4JZQnw-raSWVI36n5jc'
)

// Call the setCredentials method on our oAuth2Client instance and set our refresh token.
oAuth2Client.setCredentials({
  refresh_token: '1//04n4PLlbSQAWVCgYIARAAGAQSNwF-L9IrWi4zAVnxZ_PrYmYCZOqtCL5HDt496NHfLazOOkab5oLC46NfthK7D2pnaT0aeJSSnwQ',
})

// Create a new calender instance.
const calendar = google.calendar({ version: 'v3', auth: oAuth2Client })

// Create a new event start date instance for temp uses in our calendar.
const eventStartTime = new Date()
$debut =  +23
$fin = $jour_fin+23
eventStartTime.setDate(eventStartTime.getDay() + $debut)
//eventStartTime.setHours(eventStartTime.getHours() )
//eventStartTime.setMinutes(eventStartTime.getMinutes() )

// Create a new event end date instance for temp uses in our calendar.
const eventEndTime = new Date()
eventEndTime.setDate(eventEndTime.getDay() + $fin )
eventEndTime.setMinutes(eventEndTime.getMinutes() + 45) //+45 = durée du rdv

// Create a dummy event for temp uses in our calendar
const event = {
  summary: `Meeting with ${name}`,
  location: `3595 California St, San Francisco, CA 94118`,
  description: `Meet with David to talk about the new client project and how to integrate the calendar for booking.`,
  colorId: 1,
  start: {
    dateTime: eventStartTime,
    timeZone: 'America/Denver',
  },
  end: {
    dateTime: eventEndTime,
    timeZone: 'America/Denver',
  },
}

// Check if we a busy and have an event on our calendar for the same time.
calendar.freebusy.query(
  {
    resource: {
      timeMin: eventStartTime,
      timeMax: eventEndTime,
      timeZone: 'America/Denver',
      items: [{ id: 'primary' }],
    },
  },
  (err, res) => {
    // Check for errors in our query and log them if they exist.
    if (err) return console.error('Free Busy Query Error: ', err)

    // Create an array of all events on our calendar during that time.
    const eventArr = res.data.calendars.primary.busy

    // Check if event array is empty which means we are not busy
    if (eventArr.length === 0)
      // If we are not busy create a new calendar event.
      return calendar.events.insert(
        { calendarId: 'primary', resource: event },
        err => {
          // Check for errors and log them if they exist.
          if (err) return console.error('Error Creating Calender Event:', err)
          // Else log that the event was created.
          return console.log('Calendar event successfully created.')
        }
      )

    // If event array is not empty log that we are busy.
    return console.log(`Sorry I'm busy...`)
  }
)
