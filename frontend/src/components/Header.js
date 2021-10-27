import React from 'react'
import { useState } from 'react'

function Header({ pkg }) {


    console.log("ACTIVE USER ID: ", pkg.activeUser.id)



    return (
        <div id="header">
            <Link to={`/patrons/${pkg.activeUser.id}`} />
        </div>
    
    )
    
}
export default Header;