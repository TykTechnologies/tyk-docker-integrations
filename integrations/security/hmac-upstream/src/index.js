const express = require('express');
const crypto = require('crypto');
const app = express();

const SECRET = 'topsecret'

// Create middleware that verifies HMAC
app.use((function (req, res, next) {
  const authorization = req.headers['authorization'];

  if (! authorization) {
    console.log('No authorization header');
    res.sendStatus(401);
    return;
  }

  const signature = decodeURIComponent(RegExp('^.*,signature=\"(.+)\"$').exec(req.headers['authorization'])[1]);

  // Grab header order and encoded signature
  const match = RegExp('^.*,headers="(.+)".*,signature=\"(.+)\"$').exec(req.headers['authorization'])
  const headers = decodeURIComponent(match[1])
  const encodedSignature = decodeURIComponent(match[2])

  if (! headers || ! encodedSignature) {
    console.log('Signature not found');
    res.sendStatus(401);
    return;
  }

  // Recreate header to create signature
  let hmacString = ""
  headers.split(' ').forEach(header => {
    if (req.headers[header]) {
      hmacString += '\n' + header + ': ' + req.headers[header];
    } else if ('(request-target)' == header) {
      hmacString += '(request-target): ' + req.method.toLowerCase() + ' ' + req.url;
    } else if ('connection' == header) {
      hmacString += '\nconnection: keep-alive';
    } else {
      console.log('Missing header ' + header);
      res.sendStatus(401);
      return;
    }
  });

  // Recreate signature
  const hash = crypto.createHmac('sha256', SECRET)
    .update(hmacString)
    .digest('base64');

  // Check signature validity
  if (hash !== encodedSignature) {
    console.log('Invalid signature');
    res.sendStatus(401);
    return;
  }

  next();
}));

app.get('/hmac', (req, res, next) => {
  res.json({
    users: [
      {
        username: 'test1',
        email: 'test1@tyk.io',
      },
      {
        username: 'test2',
        email: 'test2@tyk.io',
      },
      {
        username: 'test3',
        email: 'test3@tyk.io',
      },
    ],
  });
});

app.listen(3030);
