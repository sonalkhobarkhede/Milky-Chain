import React from 'react'
// import AdminService from '../services/AdminService';

class Signin extends React.Component{
  constructor(props){
      super(props);
      this.state = {
          "email": "",
          "password":"",
         
      }
      this.onChange = this.onChange.bind(this)
      this.onSubmit = this.onSubmit.bind(this)
  }
  onChange(e){
      this.setState({[e.target.name] : e.target.value})
  }
  onSubmit(e){
      e.preventDefault(); 
    //   this.state.email="sonalkh12@gmail.com";
    //   this.state.password="sonal";
    
          console.log("in onSubmit method")
          if (this.state.email === "sonal@gmail.com" && this.state.password ==="sonal"){   
              alert("Logged in Successfully !!")
              this.props.history.push("/home");
          }else{
            alert("Username or Password is incorrect")
          }
  }

  render(){
    return(
        
        <div className="container-fluid d-flex justify-content-center" style={{ marginTop: "200px"}}>
            <div className="card p-5" style={{minWidth:'20%', maxWidth: '100%', height:'100%' , backgroundColor: "whitesmoke"}}>
            <h3>Admin Login</h3>
            <p></p>
            <form onSubmit={this.onSubmit}>
                <div className="row p-2">
                    <input type="email" className="form-control" placeholder="Email" name="email" required onChange={this.onChange}/>
                </div>
                <div className="row p-2">
                    <input type="password" className="form-control" placeholder="Password" name="password" required onChange={this.onChange}/>
                </div>
                <div className="row p-2 justify-content-center mt-3">
                    <input type="submit" className="btn btn-success w-50" value="Signin"/>
                </div>
            </form>
            </div> 
        </div>
        )}
}



export default Signin
