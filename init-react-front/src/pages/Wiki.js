import React from 'react';
import NavbarComp from '../components/NavbarComp';
import Plants from '../components/wiki/plants';
import { Container, Row } from 'react-bootstrap';

export default function Wiki() {
    

    return (
        <div>
            <NavbarComp />
            <Container>
                <h1>Wiki</h1>
                <Row>
                    <Plants></Plants>
                </Row>
            </Container>
        </div>
    )
}

