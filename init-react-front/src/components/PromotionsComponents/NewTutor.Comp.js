
import React, { useState }  from 'react';

import axios from "axios";
import { useNavigate } from 'react-router-dom';
import { Button, Form, Container, Row, Dropdown} from 'react-bootstrap';
import NavbarComp from '../NavbarComp';



  
export default function NewTutorComp(props) {

   

    const navigate = useNavigate();
    
    const [formValue, setformValue] = useState({
        first_name: ' ',
        last_name: ' '
    });

    const handleChange = (event) => {
        setformValue({
            ...formValue,
            [event.target.name]: event.target.value
        });
    }

    const handleSubmit = event => {

        event.preventDefault();

        axios.post(`http://127.0.0.1:9010/dashboard/tutor`, { formValue })
          .then(res => {
            console.log('start post ----------');
            console.log(res);
            navigate(`/promotions`, { state: { id:res.data.data.insertId, promotion:formValue }})  // redirect
          })
      }


    return (

    <div>

    <NavbarComp />
        <Container  className="mt-4 mb-5">

            <Form onSubmit={handleSubmit}>

            <h1 data-aos-duration="4000" data-aos="fade-up" data-aos-offset="200">Formulaire de creation d'un nouveau formateur !</h1> <br />
            <h3 data-aos-duration="4000" data-aos="flip-up">Le mot de passe et l'adresse email sont générés automatiquement !</h3> <br />
            <h3 data-aos-duration="4000" data-aos="flip-down">Veuillez renseigner uniquement le nom et le prénom du formateur</h3> <br />

                <Form.Group data-aos-duration="4000" data-aos="flip-down" className="mb-3" controlId="formBasicEmail">
                    <Form.Label>Prénom : </Form.Label>
                    <Form.Control defaultValue={formValue.first_name} onChange={handleChange} name="first_name" placeholder="Votre prénom" />
                </Form.Group>

                <Row>
                    <Form.Group data-aos-duration="4000" data-aos="flip-down" className="mb-3 col-6" controlId="formBasicEmail">
                        <Form.Label>Nom :</Form.Label>
                        <Form.Control defaultValue={formValue.last_name} onChange={handleChange} name="last_name" placeholder="Votre nom" />
                    </Form.Group>
                </Row>
                <Dropdown>
        <Dropdown.Menu>
          <Dropdown.Item href="#">
            Home Page
          </Dropdown.Item>
          <Dropdown.Item href="#">
            Settings
          </Dropdown.Item>
          <Dropdown.Item href="#">
            Logout
          </Dropdown.Item>
        </Dropdown.Menu>
      </Dropdown>
                <Row>
                </Row>         
                <Button  variant="primary" type="submit" >
                    Ajouter</Button>

            </Form>
        </Container>    
        </div>
      )
};