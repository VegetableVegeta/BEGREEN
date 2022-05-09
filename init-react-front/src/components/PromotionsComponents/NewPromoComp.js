import React, { useState }  from 'react';
import axios from "axios";
import { useNavigate } from 'react-router-dom';
import { Button, Form, Container, Row} from 'react-bootstrap';
import NavbarComp from '../NavbarComp';

export default function NewPromoComp(props) {

    const navigate = useNavigate();
    
    const [formValue, setformValue] = useState({
        title: ' ',
        year: ' '
    });

    const handleChange = (event) => {
        setformValue({
            ...formValue,
            [event.target.name]: event.target.value
        });
    }

    const handleSubmit = event => {

        event.preventDefault();

        axios.post(`http://127.0.0.1:9010/dashboard/promotion`, { formValue })
          .then(res => {
            console.log('start post ----------');
            console.log(res);
            navigate(`/promotions`)  // redirect
          })
      }


    return (

    <div>
    <NavbarComp />
        <Container  className="mt-4 mb-5">

            <Form onSubmit={handleSubmit}>

            <h1>Formulaire de creation d'un nouveau formateur !</h1>

                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Label>Nom de la Promotion : </Form.Label>
                    <Form.Control defaultValue={formValue.title} onChange={handleChange} name="title" placeholder="Nom" />
                    <Form.Text className="text-muted"></Form.Text>
                </Form.Group>

                <Row>
                    <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
                        <Form.Label>Date de début de la promotion :</Form.Label>
                        <Form.Control defaultValue={formValue.year} onChange={handleChange} name="year" placeholder="Anéee" />
                        <Form.Text className="text-muted"></Form.Text>
                    </Form.Group>
                </Row>
                <Row>                 
                </Row>
                <Row>
                </Row>
                <Row>
                </Row>         
                <Button  variant="primary" type="submit" >
                    Evoyer</Button>

            </Form>
        </Container>    
        </div>
      )
};