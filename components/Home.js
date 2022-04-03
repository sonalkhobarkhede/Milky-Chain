import { Link } from 'react-router-dom';

const Home = () => {
    let name = localStorage.getItem("admin")
    function logout(){
        localStorage.clear();
        window.location='/signin'
    }
    return (

        <div>
            <nav className="navbar navbar-expand-lg navbar-light bg-light">
                <div className="container-fluid">
                    <a className="navbar-brand" href="/home">
                    Admin
                    </a>
                    <button
                    className="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    aria-controls="navbarNav"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span className="navbar-toggler-icon"></span>
                    </button>
                    <div className="collapse navbar-collapse" id="navbarNav">
                    <ul className="navbar-nav">
                        <li className="nav-item">
                            <Link className="nav-link" to="/addproduct">
                                AddProduct
                            </Link>
                        </li>
                        <li>
                            <Link className="nav-link" to="/admin/changerate">
                                ChangeRate
                            </Link>
                        </li>
                        <li>
                            <Link className="nav-link" to="/admin/addSupplier">
                            AddSuppplier
                            </Link>
                        </li>
                        <li>
                            <Link className="nav-link" to="/addsupplier">
                            RemoveSupplier
                            </Link>
                        </li>

                        <li>
                            <Link className="nav-link" to="/addsupplier">
                            ViewSupplier
                            </Link>
                        </li>

                        <li>
                            <Link className="nav-link" to="/addsupplier">
                            UpdateInfo
                            </Link>
                        </li>
                    
                    </ul>
                    
                    </div>
                    <div className="d-flex">
                        <ul className="navbar-nav">
                            <li className="nav-item">
                                <span className="nav-link">{name}</span>
                            </li>
                            <li className="nav-item">
                                <Link className="btn btn-danger float-right" onClick={logout}>Logout</Link>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    )
}

export default Home;