import React from 'react'
import { useState } from 'react'

import Header from './Header'

function Home() {

    const [ activeUser, setActiveUser ] = useState({id: 1})
    const [ selectedUser, setSelectedUser ] = useState({id: 1})
    const dbURL = 'http://localhost:9292/db/'

    let pkg = {
        currentUser: currentUser,
        setCurrentUser: setCurrentUser,
        
        selectedUser: selectedUser,
        setSelectedUser: setSelectedUser,

        dbURL: dbURL
    }

    return (
        <Header pkg={pkg}/>
    )

export default Home;