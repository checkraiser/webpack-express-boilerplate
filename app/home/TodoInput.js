import React from 'react';
import styles from './App.css';
import Store from './Store';
import Notie from 'notie-js';

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
  onClickAdd(e){
    if (Store.get().inputText.trim().length === 0){
      Notie.alert(3, 'Error.', 2.5);
    } else {
      Store.trigger("todo:create", Store.get().inputText.trim());
    }
  }
  render() {
    return (
      <form>
        <input id="new_todo_input" type="text" value={Store.get().inputText} onChange={this.handleChange} onKeyDown={this.handleNewTodoKeyDown}>
        </input>
        <button id="add" onClick={this.onClickAdd}>Add</button>
      </form>
    );
  }
}
