import React, { useState, useEffect }  from 'react';
import axios from "axios";
import {useLocation} from 'react-router-dom';
import NavbarComp from '../components/NavbarComp';
import { Container, Row, Col } from 'react-bootstrap';
import Plant from '../components/wiki/plant';
import PlantCard from '../components/wiki/plantCard'


export default function PlantPage(props) {

    const location = useLocation();
    const plantID = location.state.id
    const plant = location.state.plant

    const [otherPlants, setOtherPlants] = useState([]);

    console.log(`other plant`);
    console.log(otherPlants);


    // Fetch other plant from the same family 
    useEffect(() => {
        axios.get(`http://localhost:9012/dashboard/wiki/family?id=${location.state.plant.id}&familyid=${location.state.plant.family_id}`)
        .then(res => {
            setOtherPlants(res.data.data)
        })
        .catch(err => {
          console.log(err);
        })
    }, [])

    console.log(otherPlants);

    const famillyPlants = otherPlants

    return (
        <div>
            <NavbarComp />
            <Container className="mt-3">
                <h1 className="mb-5">Plant</h1>

                    <Plant datas={plant}/>
            </Container>

            <Container className="mt-5 mb-5">
                <h3 className="mb-5">Autre plant de la même famille</h3>
                <Row>
                    <PlantCard datas={famillyPlants}/>
                </Row>
            </Container>
            
        </div>
    );
};
