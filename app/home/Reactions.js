import Store from './Store';

Store.on('todo:create', (content) => {
  fetch('/api/v1/todos', {
    method: 'post',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      content: content
    })
  })
})
