import React, { Component } from 'react';


let { Component } = react;

class Calculator extends Component {
  constructor(props) {
    super(props);

    this.state = {
      num1: '',
      num2: '',
      result: 0 
    }

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.showResult = this.showResult.bind(this);
    
  }

  setNum1(e) {
    e.preventDefault();
    this.setState({
      num1: e.target.value
    })
  }

  setNum2(e) {
    e.preventDefault();
    this.setState({
      num2: e.target.value
    })
  }

  showResult(e) {
    let operation = e.target.innerHTML;
    let {num1, num2} = this.state;
    num1 = Number(num1);
    num2 = Number(num2);
    switch(operation) {
      case '+':
        this.setState({
          result: num1 + num2
        })
        break;
      case '-':
        this.setState({
          result: num1 - num2
        })
        break;
      case '/':
        this.setState({
          result: num1 / num2
        })
        break;
      case '*':
        this.setState({
          result: num1 * num2
        })
        break;
      default:
        break;
    }
  }

  render() {
    const {result, num1, num2} = this.state;
    const {setNum1, setNum2} = this;
    return (
      <div>
        <h1>Calculator</h1>
        <h1>{result}</h1>
        <label>SetNum1
          <input onChange={setNum1} value={num1} />
        </label>
        <label>SetNum2
          <input onChange={setNum2} value={num2}/>
        </label>
        <br />
        <button onClick={this.showResult}>+</button>
        <button onClick={this.showResult}>-</button>
        <button onClick={this.showResult}>*</button>
        <button onClick={this.showResult}>/</button>
        <button onClick={this.clear}>Clear</button>
      </div>
    );
  }
}



export default Calculator;