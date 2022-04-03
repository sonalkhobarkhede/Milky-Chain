import React from "react";

export default class ViewSupplier extends React.Component
{
    state = {data : []}

    componentDidMount()
    {
       var promise = fetch("http://localhost:9090/supplier", {
           "method": "Post",  })

       var anotherpromise=promise.then(reponse=>{
             return reponse.json()
       })

       anotherpromise.then(jasondataarr=>{
           this.setState({data:jasondataarr})
           console.log(jasondataarr);
           
       })
                     
       promise.catch(err => { console.log(err); 
       });
    }

  
    // supplier details
  render()
  {
      return(
          <div>
              <table border="1">
                  <tr><th>Supplier FName</th>
                  <th>Last Name</th>
                  <th>Mobile No</th>
                  <th>Email</th>
                  <th>Address</th>
                  <th>Work Pincode</th>
                  <th>Work Area</th></tr>
               {
                   this.state.data.map((ele , index)=>{
                       return(<tr><td>{ele.supplierFname}</td><td>{ele.supplierLname}</td><td>{ele.supplierMobileNo}</td><td>{ele.supplierWorkingArea}</td><td>{ele.supplierAddress}</td></tr>)  
                   })
               }
               </table>
          </div>
      )
  }


}