import React from 'react';
import styles from './App.css';
import Store from './Store';
export default class TodoInput extends React.Component {
  constructor(props) {
    super(props);
  }
  handleChange(event){
    Store.get().set({inputText: event.target.value}).now();
  }
  handleNewTodoKeyDown(event){
    if (event.keyCode !== 13) {return; }
    event.preventDefault();
    Store.trigger("todo:create", Store.get().inputText.trim());
  }
  render() {
    return (
      <input type="text" value={Store.get().inputText} onChange={this.handleChange}
         onKeyDown={this.handleNewTodoKeyDown}>
      </input>

    );
  }
}
