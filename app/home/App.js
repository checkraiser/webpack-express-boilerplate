import React from 'react';
import styles from './App.css';
import Store from './Store';
import TodoInput from './TodoInput';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {todos: Store.get().todos};
  }
  componentDidMount(){
    let me = this;
    Store.on('update', function(){
      me.forceUpdate();
    });
  }
  render() {
    let todosList = this.state.todos.map((x) => <li key={x.id}>{x.content}</li>)
    return (
      <div>
      <h2>Todos</h2>
      <TodoInput />
      <ul>
        {todosList}
      </ul>
      </div>
    );
  }
}
