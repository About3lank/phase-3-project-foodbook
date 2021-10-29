import React from 'react'
import { useState, useEffect } from 'react'

import MealRow from './MealRow'

function Profile({pkg}) {

    const canEdit = pkg.activeUser.id === pkg.selectedUser.id
    const [ userData, setUserData ] = useState({})

    const [ updater, setUpdater ] = useState(0)

    console.log("URL: ", pkg.dbURL + "patrons/" + pkg.selectedUser.id)

    

    useEffect( () => {
        fetch(pkg.dbURL + "patrons/" + pkg.selectedUser.id)
        .then(r => r.json())
        .then(data => setUserData(data))
    }, [])

    console.log("CAN EDIT: ", canEdit)

    console.log("USER DATA: ", userData)

    // debugger

    return (
        <>
            <h1>{userData.name}</h1>
            <img class="profile-pic" src={userData.image} alt={userData.name} />


            <table class="meals-table">
                <tr class="meals-top-row">
                    <th>Date</th>
                    <th>Restaurant</th>
                    <th>Orders</th>
                    <th>Rating</th>
                    <th>Comment</th>
                    {canEdit? <th>Delete</th> : null}
                </tr>
                {userData.meals?.map(meal => <MealRow pkg={pkg} meal={meal} canEdit={canEdit} />) }
            </table>
                
           
        </>


    )
}

export default Profile;