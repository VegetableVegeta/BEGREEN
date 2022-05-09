import React, { useState, useEffect }  from 'react';
import ReactDOM from "react-dom";
import axios from "axios";
import { useNavigate, useParams, useLocation } from 'react-router-dom';
import NavbarComp from '../components/NavbarComp';
import { Button, Form, Container, Row} from 'react-bootstrap';

export default function LoginForm(props) {

    const location = useLocation();
    const navigate = useNavigate();
    
    //console.log(location.state.status);
    //console.log(location.state.data);

    const plantId = location.state.data.id
    //console.log(location.state.data);

    const [formValue, setformValue] = useState({
        name: ' ',
        latin_name: ' ',
        description: ' ',
        origin: ' ',
        flowering: ' ',
        foliage: ' ',
        plantation_period: ' ',
        plantation_location: ' ',
        published_date: ' ',
        creator_id: 1,
        review: ' ',
        review_id: ' ',
        family_id: 1,
        status_id: 0,
    });


    if (location.state.status === 'update'){
        formValue.name = location.state.data.name;
        formValue.latin_name = location.state.data.latin_name;
        formValue.description = location.state.data.description;
        formValue.origin = location.state.data.origin;
        formValue.flowering = location.state.data.flowering;
        formValue.foliage = location.state.data.foliage;;
        formValue.plantation_period = location.state.data.plantation_period;
        formValue.plantation_location = location.state.data.plantation_location;
        formValue.published_date = location.state.data.published_date;
        formValue.creator_id = location.state.data.creator_id;
        formValue.review = location.state.data.review;
        formValue.review_id = location.state.data.review_id;
        formValue.family_id = location.state.data.family_id;
        formValue.status_id = location.state.data.status_id;
    }

    const handleChange = (event) => {
        console.log(event.target.value);
        let value = event.target.value
        setformValue({
            ...formValue,
            [event.target.name]: value
        });
        console.log(formValue);
    }


    const [families, setFamilies] = useState([])

    // Axios request, load a list of all plant Familly (id and name) ordered by name
    useEffect(() => {
      axios.get('http://localhost:9012/dashboard/wiki/fam')
      .then(res => {
        setFamilies(res.data.data)
      })
      .catch(err => {
        console.log(err);
      })
    }, [])

    // create a option balise for each plant family - this option goes in the form select
    const listPlantFamily = families.map((family) => { 
    return (
        <option  value={family.id}>
            {family.name}
        </option>           
        )
    })

    // Submit execute a post request - new Plant - or a put request - update plant - according to the params value :location.state.status (possible value create OR update)
    const handleSubmit = event => {
        event.preventDefault();

        // check if user choose a plant Familly - if not send an alert
        if (formValue.family_id === 'NaN' ) {
            alert('Veuillez choisir une famille de plante !');
        }

        setformValue({
            ...formValue,
            [event.target.name]: event.target.value
        });

        if (location.state.status === 'create'){
            console.log(formValue);
            axios.post(`http://localhost:9012/dashboard/wiki/plant`, { formValue })
            .then(res => {
                console.log(res);
                navigate(`/plant/${res.data.data.insertId}`, { state: { id:res.data.data.insertId, plant:formValue }})  // redirect
            });
        } else if (location.state.status === 'update'){
            console.log("in axios");
            console.log(formValue);
            console.log(location.state.data.id);
            axios.put(`http://localhost:9012/dashboard/wiki/plant?id=${location.state.data.id}`, { formValue })
            .then(res => {
                console.log(res);
                navigate(`/plant/${res.data.data.insertId}`, { state: { id:res.data.data.insertId, plant:formValue }})  // redirect
            });
        }
      }


    return (

    <div>

        <NavbarComp />

        <Container  className="mt-4 mb-5">

            <Form onSubmit={handleSubmit}>

            <h1>Formulaire de creation d'une nouvelle Plant !</h1>

                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Label>Nom</Form.Label>
                    <Form.Control defaultValue={formValue.name} onChange={(e) => { handleChange(e); }} name="name" placeholder="nom de la plante" />
                    <Form.Text className="text-muted">We'll never share your email with anyone else.</Form.Text>
                </Form.Group>

                <Row>
                    <Form.Group className="mb-3 col-6" controlId="formBasicStudent">
                        <Form.Label>Famille</Form.Label>
                        <Form.Select aria-label="Famille de la plant :" onChange={handleChange}  name="family_id">          
                            <option selected>Choississez une famille</option>
                            {listPlantFamily}                   
                        </Form.Select>         
                    </Form.Group>
                </Row>

                <Row>
                    <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
                        <Form.Label>Nom latin</Form.Label>
                        <Form.Control defaultValue={formValue.latin_name} onChange={handleChange} name="latin_name" placeholder="nom latin" />
                        <Form.Text className="text-muted"></Form.Text>
                    </Form.Group>
                    
                    <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
                        <Form.Label>origin</Form.Label>
                        <Form.Control defaultValue={formValue.origin} onChange={handleChange} name="origin" placeholder="origin" />
                        <Form.Text className="text-muted"></Form.Text>
                    </Form.Group>
                </Row>

                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Label>Description</Form.Label>
                    <Form.Control  as="textarea" rows={3} value={formValue.description} onChange={handleChange} name="description" placeholder="description" />
                    <Form.Text className="text-muted">Entrez ici une description</Form.Text>
                </Form.Group>

                <Row>
                    <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
                        <Form.Label>Fleuraison</Form.Label>
                        <Form.Control defaultValue={formValue.flowering} onChange={handleChange} name="flowering" placeholder="Fleuraison" />
                        <Form.Text className="text-muted">A quelle saison cette plante fleurie</Form.Text>
                    </Form.Group>

                    <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
                        <Form.Label>Feuillage</Form.Label>
                        <Form.Control defaultValue={formValue.foliage} onChange={handleChange} name="foliage" placeholder="Feuillage" />
                        <Form.Text className="text-muted">A quelle saison cette plante fleurie</Form.Text>
                    </Form.Group>
                </Row>

                <Row>
                    <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
                        <Form.Label>Période de plantation</Form.Label>
                        <Form.Control defaultValue={formValue.plantation_period} onChange={handleChange} name="plantation_period" placeholder="Période de plantation" />
                        <Form.Text className="text-muted">A quelle saison cette plante doit être plantée</Form.Text>
                    </Form.Group>

                    <Form.Group className="mb-3 col-6" controlId="formBasicEmail">
                        <Form.Label>Ou planter</Form.Label>
                        <Form.Control defaultValue={formValue.plantation_location} onChange={handleChange} name="plantation_location" placeholder="Ou planter" />
                        <Form.Text className="text-muted"></Form.Text>
                    </Form.Group>
                </Row>
                
                <Button variant="primary" type="submit">
                    Sauvegarder
                </Button>

            </Form>
        </Container>
        </div>
      )
};






    // const handleSubmit = async() => {


      
    //     axios.post('http://127.0.0.1:9012/dashboard/wiki/plant', {
    //         name: 'roger',
    //         description: 'une jolie fleur qui sent bon'
    //     })
    //     .then(function (response) {
    //         console.log(response);
    //     })
    //     .catch(function (error) {
    //         console.log(error);
    //     });

    //     try {
    //         // make axios post request      
            
    //         // const response = await axios({
    //         // method: "post",
    //         // url: "http://127.0.0.1:9012/dashboard/wiki/plant",
    //         // // data: user,
    //         // // headers: { "Content-Type": "multipart/form-data" },
    //         // });
    //     } catch(error) {
    //         console.log(error)
    //     }
    // }