import axios from 'axios';

const ADMIN_API_BASE_URL = "http://localhost:9090/AdminViews/addProductInDb";

class ProductService {

    getProducts(){
        return axios.get(ADMIN_API_BASE_URL);
    }

    createProduct(products){
        return axios.post(ADMIN_API_BASE_URL, products);
    }

    getProductById(prod_id){
        return axios.get(ADMIN_API_BASE_URL + '/' + prod_id);

    }

    updateProduct(products, prod_id){
        return axios.put(ADMIN_API_BASE_URL + '/' + prod_id, products);
    }

    deleteProduct(prod_id){
        return axios.delete(ADMIN_API_BASE_URL + '/' + prod_id);
    }
}

export default new ProductService()