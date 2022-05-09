import React from 'react';
import { Navbar, Nav, NavDropdown, Form, FormControl, Button, Container } from 'react-bootstrap';
import { NavLink } from 'react-router-dom';
import Cards from '../pages/Cards';
import Promotions from '../pages/Promotions';
import Quizzes from '../pages/Quizzes';
import Wiki from '../pages/Wiki';

const NavbarComp = () => {
    return (
        <div>          
                <Navbar className='navbar' expand="lg">
                    <Container fluid>
                        <Navbar.Brand href="#"><img src="beGreenBlancWeb.png" className='logo' alt="logo" /></Navbar.Brand>
                        <Navbar.Toggle aria-controls="navbarScroll" />
                        <Navbar.Collapse id="navbarScroll">
                            <Nav
                                className="me-auto my-2 my-lg-0 nav-links"
                                style={{ maxHeight: '100px' }}
                                navbarScroll
                            >
                                <NavLink to="/wiki" className="nav-link">
                                Encyclopédie
                                </NavLink>
                                <NavLink to="/cards" className="nav-link">
                                    <li>Mes Fiches</li>
                                </NavLink>
                                <NavLink to="/quizzes" className="nav-link">
                                    <li>Quiz</li>
                                </NavLink>
                                <NavLink to="/promotions" className="nav-link">
                                    <li>Promotion</li>
                                </NavLink>
                            </Nav>
                            <Form className="d-flex">
                                <Nav.Link>
                                    <img src="user.png" className='user' alt="logo" />
                                </Nav.Link>
                            </Form>
                        </Navbar.Collapse>
                    </Container>
                </Navbar>               
        </div>
    );
};

export default NavbarComp;