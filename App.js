import './App.css';
import Home from './components/Home';
import Signin from './components/Signin';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import { createBrowserHistory } from 'history';
import frontpage from './components/frontpage';
import AddProduct from './components/AddProduct';


const history = createBrowserHistory();

function App() {
    
    if(localStorage.getItem("email") === null || localStorage.getItem("password") === ""){
      return (
          <div className="App">
            <BrowserRouter history={history}>
              <Switch>
              <Route exact path="/" component={Signin} />
              <Route exact path="/signin" component={Signin} />
              <Route path="/front" component={frontpage}/>
              <Route path="/home" component={Home} />
             <Route path="/addProduct" component={AddProduct} />

            </Switch>
            </BrowserRouter>
          </div>
        )
    }else{
      return (
        <BrowserRouter>
        <Home/>
          <div className="container">
              <Switch>
                <Route exact path="/home" component={Home} />
                <Route path="/signin" component={Signin} />
              </Switch>
          </div>
          </BrowserRouter>
      )
    }
}

export default App;
