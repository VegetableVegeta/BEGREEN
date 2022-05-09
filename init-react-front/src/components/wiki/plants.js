import React, { useState, useEffect } from "react";
import axios from "axios";
import PlantCard from "./plantCard";

export default function Plants() {

    const [plants, setPlants] = useState([]);

    // axios request, fetch all published plants
    useEffect(() => {
        axios.get('http://localhost:9012/dashboard/wiki/plants')
        .then(res => {
          setPlants(res.data.data)
        })
        .catch(err => {
          console.log(err);
        })
    }, [])

    const data = plants

    return (

      

      <PlantCard datas={data}/>

    )
}
  
    
