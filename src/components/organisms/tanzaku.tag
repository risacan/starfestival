<star-tanzaku>
  <div>
    <ul>
      <li each="{ wish in wishes }"><p>{ wish.text }</p></li>
    </ul>
  </div>

  <style>
    star-tanzaku div {
      width: 100%;
      height: 100%;
      display: flex;
      flex-start: center;
      flex-flow: column wrap;
    }
    star-tanzaku li {
      display: inline-block;
      height: 400px;
      width: auto;
      margin: auto;
      background-color: pink;
      margin: 10px;
      flex: 1;
      -webkit-writing-mode: vertical-rl;
      -ms-writing-mode: tb-rl;
      writing-mode: vertical-rl;
      vertical-align: center;
    }
    star-tanzaku p {
      margin-top: 50px;
    }
  </style>
  <script>
    let auth = require("../../firebase").auth;
    let database = require("../../firebase").database;
    this.wishes = [];

    this.on("mount", () => {
      // Listeners
      database.ref("/wishes").on("child_added", (data) => {
        this.wishes.unshift(data.val());
        this.update();
      })
    });
  </script>
</star-tanzaku>