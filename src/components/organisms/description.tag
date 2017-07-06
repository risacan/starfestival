require("../molecules/title")
require("../molecules/desc")
require("../molecules/form")

<star-description>
  <div>
    <star-title></star-title>
    <star-desc></star-desc>
    <star-form></star-form>
  </div>

  <style>
    star-description div {
      background-color: #eee;
      margin: 30px auto 10px;
      padding: 20px;
      border-radius: 10px;
      max-width: 800px;
    }
  </style>
</star-description>
