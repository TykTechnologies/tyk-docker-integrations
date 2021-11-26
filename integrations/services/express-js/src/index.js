var express = require('express');
var app = express();

app.get('/user', (req, res, next) => {
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
