import React from 'react'
import { useState } from 'react'

function MealRow({pkg, meal, canEdit}) {

    const [ expanded, setExpanded ] = useState(false)

    function expandHandler() {
        // setExpanded(!expanded)
        console.log("disabled for now")
    }

    const deleteHandler = () => {
        
        console.log("delete clicked...")

        fetch(pkg.dbURL + "meals/" + meal.id, {
            method: "DELETE"
        })
    }

    // code
    return (
        <>
            <tr onClick={expandHandler}>
                <td>{meal.date}</td>
                <td>{meal.restaurant.name}</td>
                <td>{meal.menu_items.map( i => <p>{i.name}</p>)}</td>
                <td>{meal.rating === 0? "" : meal.rating}</td>
                <td>{meal.comment}</td>
                {canEdit? <button class="delete-button" onClick={deleteHandler}>DELETE</button>: null}
            </tr>
            {expanded? <div onClick={expandHandler}>

            </div> : null}
        </>

    )
}

export default MealRow;