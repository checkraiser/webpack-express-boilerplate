import Store from './Store';
let access_token = window.__ACCESSTOKEN__ || '123';
Store.on('todo:create', (content) => {
  fetch('/api/v1/todos', {
    method: 'post',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      content: content,
      access_token: access_token
    })
  }).then((response) => response.json())
  .then((json) => {
    Store.set({todos: json});
  })
})
