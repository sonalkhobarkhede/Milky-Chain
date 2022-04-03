import React, { Component } from 'react'
import ProductService from '../services/ProductService';


class AddProduct extends Component {
    constructor(props) {
        super(props)

        this.state = {
            
            productId : this.props.match.params.productId,
            productName: '',
            milkType: '',
            productionPerDayLiter: '',
            pricePerLiter: '',
        }
        this.changeproductNameHandler = this.changeproductNameHandler.bind(this);
        this.changemilkTypeHandler = this.changemilkTypeHandler.bind(this);
        this.changeproductionPerDayLiterHandler = this.changeproductionPerDayLiterHandler.bind(this);
        this.changepricePerLiterHandler = this.changepricePerLiterHandler.bind(this);
        this.saveOrUpdateProduct = this.saveOrUpdateProduct.bind(this);
    }

    
    componentDidMount(){

        
        if(this.state.productId === '_add'){
            return
        }else{
            ProductService.getProductById(this.state.productId).then( (res) =>{
                let product = res.data;
                this.setState({productName: product.productName,
                    milkType : product.milkType,
                    productionPerDayLiter : product.productionPerDayLiter,
                    pricePerLiter : product.pricePerLiter,
                });
            });
        }        
    }
    saveOrUpdateProduct = (e) => {
        e.preventDefault();
        let product = {productName: this.state.productName, milkType: this.state.milkType, productionPerDayLiter: this.state.productionPerDayLiter, pricePerLiter : this.state.pricePerLiter,
        };
        console.log('product => ' + JSON.stringify(product));

        // step 5
        if(this.state.productId === '_add'){
            ProductService.createProduct(product).then(res =>{
                this.props.history.push('/products');
            });
        }else{
            ProductService.updateProduct(product, this.state.productId).then( res => {
                this.props.history.push('/products');
            });
        }
    }
    
    changeproductNameHandler= (event) => {
        this.setState({productName: event.target.value});
    }

    changemilkTypeHandler= (event) => {
        this.setState({milkType: event.target.value});
    }

    changeproductionPerDayLiterHandler= (event) => {
        this.setState({productionPerDayLiter: event.target.value});
    }

    changepricePerLiterHandler= (event) => {
        this.setState({pricePerLiter: event.target.value});
    }

    cancel(){
        this.props.history.push('/AddProducts');
    }

    

    getTitle(){

        if(this.state.productId === '_add')
        {
            return <h3 className="text-center">Add Product </h3>
        }else{
            return <h3 className="text-center">Update Product</h3>
        }
    }
    
    render() {
        return (
            <div>
                <br></br>
                   <div className = "container">
                   <br /> <br />
                    <br /> <br />


                        <div className = "row">
                            <div className = "card col-md-6 offset-md-3 offset-md-3">
                                {
                                    this.getTitle()
                                }
                                
                                <div className = "card-body">
                                    <form>
                                    <br /> 
                                        <div className = "form-group">
                                            <label> Product  Name: </label>
                                            <input placeholder="Product Name" name="productName" className="form-control" 
                                                value={this.state.productName} onChange={this.changeproductNameHandler}/>
                                        </div>
                                        <div className = "form-group">
                                            <label> milkType: </label>
                                            <input placeholder="milkType" name="milkType" className="form-control" 
                                                value={this.state.milkType} onChange={this.changemilkTypeHandler}/>
                                        </div>
                                        <div className = "form-group">
                                            <label> productionPerDayLiter: </label>
                                            <input placeholder="productionPerDayLiter" name="productionPerDayLiter" className="form-control" 
                                                value={this.state.productionPerDayLiter} onChange={this.changeproductionPerDayLiterHandler}/>
                                        </div>


                                        <div className = "form-group">
                                            <label> pricePerLiter: </label>
                                            <input placeholder="pricePerLiter" name="pricePerLiter" className="form-control" 
                                                value={this.state.pricePerLiter} onChange={this.changepricePerLiterHandler}/>
                                        </div>

                   {/*Red Green  */}
                                        <button className="btn btn-success" onClick={this.saveOrUpdateProduct}>Save</button>
                                        <button className="btn btn-danger" onClick={this.cancel.bind(this)} style={{marginLeft: "10px"}}>Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                   </div>
            </div>
        )
    }
}

export default AddProduct