import Freezer from 'freezer-js';

let todos = window.__TODOS__ || [{id: 1, content: 'Task 1'},{id: 2, content: 'Task 2'},{id: 3, content: 'Task 6'}];

export default new Freezer({
  inputText: '',
	todos: todos
})
