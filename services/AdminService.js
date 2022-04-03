import axios from "axios";
import {url} from '../common/constants'

const admin= parseInt(localStorage.getItem("admin"));

class AdminService {

    login(admin) {
        const SIGNIN_BASE_URL = url+"/api/admin/login"+admin;
        return axios.post(SIGNIN_BASE_URL,admin);
    }

    //add new Product
    // addProduct() {
    // const add_PRODUCT_URL = url+"/api/addProduct/"+admin;
    // return axios.get(ADD_PRODUCT_URL);
    // }

	//change MilkRate
    // changeRate() {
    // const ALL_ORDERS_URL = url+"/api/changeRate/"+admin;
    // return axios.get(CHANGE_RATE_URL);
    // }

    // //insert Supplier
    // changeRate() {
    //     const ALL_ORDERS_URL = url+"/api/changeRate/"+admin;
    //     return axios.get(CHANGE_RATE_URL);
    // }

    // //delete supplierRecord
    // removeSupplier() {
    //     const ALL_ORDERS_URL = url+"/api/changeRate/"+admin;
    //     return axios.get(CHANGE_RATE_URL);
    // }	

	// //List of supplier
	// showAllSupplier() {
    //     const ALL_ORDERS_URL = url+"/api/changeRate/"+admin;
    //     return axios.get(CHANGE_RATE_URL);
    // }
    
    
	// //change Address
	// changeAddress() {
    //     const ALL_ORDERS_URL = url+"/api/changeRate/"+admin;
    //     return axios.get(CHANGE_RATE_URL);
    // }


	// //change Password
	// changePassword() {
    //     const ALL_ORDERS_URL = url+"/api/changeRate/"+admin;
    //     return axios.get(CHANGE_RATE_URL);
    // }


	// //change MobileNo
	// changeMobileNo() {
    //     const ALL_ORDERS_URL = url+"/api/changeRate/"+admin;
    //     return axios.get(CHANGE_RATE_URL);
    // }
}


export default new AdminService();