const mongoose = require('mongoose')
const Schema = mongoose.Schema
const UserSchema = new Schema({
    harga: { type: String },
    deskripsi: { type: String },
    gambar: { type: String },
    nama: { type: String },
    expired: { type: String },
    date: { type: Date, default: Date.now }

})
module.exports = mongoose.model('cookies', UserSchema)
