<star-form>
  <form onsubmit={ postWish }>
    <input placeholder="Write your wishes!" ref="wishes">
    <button>🖋</button>
  </form>
  <style>
    star-form input{
      width: 400px;
      margin: 8px auto;
    }
    star-form button {
      width: 100px;
    }
  </style>

  <script>
    let database = require("../../firebase").database;
    this.postWish = (e) => {
      e.preventDefault();
      let text = this.refs.wishes.value;
      let posted_at = new Date().getTime();
      let wishData = {
        text,
        posted_at
      };
      if (text == "") {
        return
      } else {
        let result = database.ref("wishes").push(wishData);
        this.refs.wishes.value = "";
      }
    }
  </script>
</star-form>