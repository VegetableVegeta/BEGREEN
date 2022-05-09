import React from 'react';
import NavbarComp from '../components/NavbarComp';
import { Container, Row, Col } from 'react-bootstrap';
import { Link } from 'react-router-dom';


const Cards = () => {
    return (
        <div>
            <NavbarComp />

            <Container className='pt-5'>
                <Link to="/plant/new" state={{ status: 'create', data: '' }} className="link">nouvelle fiche</Link>
            </Container>
        </div>
    );
};

export default Cards;