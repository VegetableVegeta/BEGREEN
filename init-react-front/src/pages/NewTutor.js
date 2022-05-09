
// import React, { useState, useEffect }  from 'react';

// import axios from "axios";
// import { useNavigate } from 'react-router-dom';

// import { Button, Form, Container, Row} from 'react-bootstrap';

// export default function NewTutor(props) {

//     const navigate = useNavigate();
    
//     const [formValue, setformValue] = useState({
//         first_name: '',
//         last_name: ' ',
//         email: ' ',
//         password: ' ',
//         first_connect: 0,
//         role_id: 2,
//         promotion_id: null
//       });

//     const handleChange = (event) => {
//         setformValue({
//             ...formValue,
//             [event.target.name]: event.target.value
//         });
//     }

//     const handleSubmit = event => {

//         event.preventDefault();

//         axios.post(`http://127.0.0.1:9010/dashboard/promotion`, { formValue })
//           .then(res => {
//             console.log('start post ----------');
//             console.log(res);
//             navigate(`/tutor/${res.data.data.insertId}`, { state: { id:res.data.data.insertId, user:formValue }})  // redirect
//           })
//       }

//     return (

//     <div>

        

//         <Container  className="mt-4 mb-5">

//             <Form onSubmit={handleSubmit}>

//             <h1>Formulaire de creation d'une nouvelle Plant !</h1>

//                 <Form.Group className="mb-3" controlId="formBasicEmail">
//                     <Form.Label>Nom</Form.Label>
//                     <Form.Control defaultValue={formValue.first_name} onChange={handleChange} name="name" placeholder="nom de la plante" />
//                     <Form.Text className="text-muted">We'll never share your email with anyone else.</Form.Text>
//                 </Form.Group>

//                 <Row>
//                     <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
//                         <Form.Label>Nom latin</Form.Label>
//                         <Form.Control defaultValue={formValue.last_name} onChange={handleChange} name="latin_name" placeholder="nom latin" />
//                         <Form.Text className="text-muted"></Form.Text>
//                     </Form.Group>
                    
//                     <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
//                         <Form.Label>origin</Form.Label>
//                         <Form.Control defaultValue={formValue.email} onChange={handleChange} name="origin" placeholder="origin" />
//                         <Form.Text className="text-muted"></Form.Text>
//                     </Form.Group>
//                 </Row>

//                 <Form.Group className="mb-3" controlId="formBasicEmail">
//                     <Form.Label>Description</Form.Label>
//                     <Form.Control   rows={3} defaultValue={formValue.password} onChange={handleChange} name="description" placeholder="Description" />
//                     <Form.Text className="text-muted">Entrez ici une description</Form.Text>
//                 </Form.Group>

                

                
                
//                 <Button variant="primary" type="submit">
//                     Sauvegarder
//                 </Button>

//             </Form>
//         </Container>
//         </div>
//       )
// };


import React from 'react';
import NewTutorComp from '../components/PromotionsComponents/NewTutor.Comp';


const NewTutor = () => {
    return (
        <div>
           <NewTutorComp />
            
        </div>
    );
};

export default NewTutor;