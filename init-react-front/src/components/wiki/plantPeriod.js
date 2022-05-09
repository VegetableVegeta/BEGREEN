import React, {Component} from 'react';

export default function PlantPeriod(props) {
    
    const period = props.PlantPeriod
    return (


    <div>
        { period === 'Hiver' ? <span>🌨</span> : <span>🍁</span> }
    </div>

    )
}