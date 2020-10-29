module.exports = (json)=>{
    let arr = []
    for(k in json) arr.push(json[k])
    return arr
}