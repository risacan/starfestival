<star-tanzaku>
  <div>
    <ul>
      <li each="{ wish in wishes }" class="flipMore flipAnimation"><p>{ wish.text }</p></li>
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
    star-tanzaku p {
      margin-top: 10px;
    }
    star-tanzaku li {
      display: inline-block;
      height: 400px;
      width: auto;
      margin: auto;
      margin: 10px;
      flex: 1;
      -webkit-writing-mode: vertical-rl;
      -ms-writing-mode: tb-rl;
      writing-mode: vertical-rl;
      vertical-align: center;
      position: relative;
      padding: 30px 30px;
      -webkit-box-sizing: border-box;
      border-bottom-right-radius: 60px 5px;
      -webkit-box-shadow: inset -20px -20px 5px -20px rgba(0, 0, 0, .1);
      font-size: 12px;
    }
    star-tanzaku li:before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      z-index: -1;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.2);
      -webkit-box-shadow: 1px 1px 5px 0px rgba(0, 0, 0, 0.3);
    }
    star-tanzaku li:nth-child(3n) {
      background-color: pink;
    }
    star-tanzaku li:nth-child(3n+1) {
       background-color: lightblue;
    }
    star-tanzaku li:nth-child(3n+2) {
       background-color: lightyellow;
    }
    .flip:hover {
      border-bottom-right-radius: 180px 30px;
      -webkit-box-shadow: inset -20px -20px 20px -20px rgba(0, 0, 0, .1);
    }
    .flipMore:hover {
      border-bottom-right-radius: 300px 60px;
       -webkit-box-shadow: inset -20px -20px 60px -20pxrgba(0, 0, 0, .1);
    }
    .flipAnimation {
        -webkit-transition: all .5s ease;
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