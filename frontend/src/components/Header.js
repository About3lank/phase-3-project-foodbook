import React from 'react'
import { useState, useEffect } from 'react'
// import { Link } from 'react-router'

import MealForm from './MealForm'

function Header({ pkg }) {

    const [ showAddMealForm, setShowAddMealForm ] = useState(false)

    useEffect( () => {
        fetch(pkg.dbURL + "patrons")
        .then(r => r.json())
        .then(data => pkg.setPatrons(data))
    }, [])

    // console.log("PKG DBURL: ", pkg.dbURL)

    // console.log(patrons.filter( p => p.id === pkg.activeUser.id)[0].name)


    // console.log("ACTIVE USER ID: ", pkg.activeUser.id)
    // console.log("Patrons: ", pkg.patrons)

    function formClickHandler() {
        setShowAddMealForm(!showAddMealForm)
    }


    const active_user_name = pkg.patrons?.filter( p => p.id === pkg.activeUser.id)[0]?.name
    const selected_user_name = pkg.patrons?.filter( p => p.id === pkg.selectedUser.id)[0]?.name

    return (
        <div id="header">
            <form id="user-dropdown">
                <label for="active-user">Logged in as: </label>
                <select name="active-user" id="active-user-dropdown" required>
                    <option value="" selected hidden>{active_user_name}</option>
                    
                </select>
                <label for="selected-user">View: </label>
                <select name="selected-user" id="selected-user-dropdown" required>
                    <option value="" selected hidden>{selected_user_name}</option>
                    
                </select>
            </form>
            <button onClick={formClickHandler}>ADD MEAL</button>
            {showAddMealForm? <MealForm pkg={pkg} details={"s"} /> : null}
        </div>
    
    )
    
}
export default Header;