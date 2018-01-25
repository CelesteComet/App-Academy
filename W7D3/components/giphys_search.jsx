import React from 'react';

import GiphysIndex from './giphys_index';

class GiphySearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputText: ''
    }
  }

  handleChange(e) {
    this.setState({
      inputText: e.target.value
    })
  }

  handleClick(e) {
    // send api request to giphy 
    let {fetchGiphys} = this.props;
    fetchGiphys(this.state.inputText);
  }

  render() {
    return (
      <div>
        <label>Type Here
          <input 
            type='text' 
            onChange={(e) => this.handleChange(e)} 
            value={this.state.inputText} />
          <button onClick={(e) => this.handleClick(e)}>CLICK</button>
        </label>
        <GiphysIndex giyphs={this.props.giphys} />
      </div>
    );
  }
}

export default GiphySearch;