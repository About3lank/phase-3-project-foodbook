import React from 'react'
import { useState, useEffect } from 'react'

import Header from './Header'
import Profile from './Profile'

function Home() {

    const [ activeUser, setActiveUser ] = useState({id: 1})
    const [ selectedUser, setSelectedUser ] = useState({id: 1})
    const [ patrons, setPatrons] = useState([])

    const dbURL = 'http://localhost:9292/'

    // console.log("PATRONS @Home.js: ", patrons)

    let pkg = {
        activeUser: activeUser,
        setActiveUser: setActiveUser,
        
        selectedUser: selectedUser,
        setSelectedUser: setSelectedUser,

        patrons: patrons,
        setPatrons, setPatrons,

        dbURL: dbURL
    }
 

    return (
        <>
            <Header pkg={pkg} />
            <Profile pkg={pkg} />
        </>
    )

}

export default Home;