import React, { useState, useEffect }  from 'react';
import axios from "axios";
import { useNavigate } from 'react-router-dom';
import { Button, Form, Container, Row} from 'react-bootstrap';
import NavbarComp from '../NavbarComp';

export default function NewStudentComp(props) {

    const navigate = useNavigate();
    
    const [formValue, setformValue] = useState({
        first_name: ' ',
        last_name: ' ',
        promotion_id: 'NaN'
    });

    const handleChange = (event) => {
        setformValue({
            ...formValue,
            [event.target.name]: event.target.value

        });
    }


    const [promotions, setPromotions] = useState([])

    useEffect(() => {
      axios.get('http://127.0.0.1:9010/dashboard/listpromotion')
      .then(res => {
        console.log(res);
        setPromotions(res.data.data)
      })
      .catch(err => {
        console.log(err);
      })
    }, [])
    
  

    const listpromotion = promotions.map((promotion) => { 
        return (
           
            <option  value={promotion.id}>
                {promotion.title}
            </option>           

        )
      })
// console.log(listpromotion);



    const handleSubmit = event => {

        event.preventDefault();
        if (formValue.promotion_id === 'NaN' ) {
            alert('Veuillez choisir une promotion !');
        }
        axios.post(`http://127.0.0.1:9010/dashboard/student`, { formValue })
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

            <h1>Formulaire de creation d'un nouvel apprenant !</h1>

                <Form.Group className="mb-3" controlId="formBasicStudent">
                    <Form.Label>Prénom de l'Apprenant : </Form.Label>
                    <Form.Control defaultValue={formValue.first_name} onChange={handleChange} name="first_name" placeholder='Prénom' />
                    <Form.Text className="text-muted"></Form.Text>
                </Form.Group>

                <Row>
                    <Form.Group className="mb-3 col-6" controlId="formBasicStudent">
                        <Form.Label>Nom de l'apprenant :</Form.Label>
                        <Form.Control defaultValue={formValue.last_name} onChange={handleChange} name="last_name" placeholder='Nom' />
                        <Form.Text className="text-muted"></Form.Text>
                    </Form.Group>
                </Row>
                <Row>
                    <Form.Group className="mb-3 col-6" controlId="formBasicStudent">          
                        <Form.Label>Promotion de l'apprenant :   </Form.Label><br />
                            <select onChange={handleChange}  name="promotion_id">
                                <option selected>--CHOISISSEZ UNE PROMOTION--</option>
                                {listpromotion}                   
                            </select>            
                    </Form.Group>
                </Row>        
                <Button  variant="primary" type="submit" >
                    Envoyer
                </Button>

            </Form>
        </Container>    
        </div>
      )
};