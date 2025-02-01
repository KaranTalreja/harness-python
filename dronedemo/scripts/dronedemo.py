from dronedemo.main import app


def cli_entry() -> None:
    app.run(host='0.0.0.0', port=5000)
