import React from 'react';
import styles from './App.css';
import Store from './Store';
import TodoInput from './TodoInput';

export default class App extends React.Component {
  constructor(props) {
    super(props);
  }
  componentDidMount(){
    var self = this;
    Store.on('update', () => self.forceUpdate());
  }
  render() {
    let todosList = Store.get().todos.map((x) => <li key={x.id}>{x.content}</li>)
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
