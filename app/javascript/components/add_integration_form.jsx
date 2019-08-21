import React from "react"
import DisplayForm from "./display_form"
import DisplayWidget from "./display_widget"

export default class AddIntegrationForm extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      name: this.props.name || '',
      app: this.props.app || '',
      data: this.props.data || '',
      error: false,
      errors: '',
      hasInitialState: false,
    }
  }

  componentDidMount() {
    if (this.props.name) {
      this.setState({ hasInitialState: true })
    }
  }

  render() {
    const token = $('meta[name="csrf-token"]').attr("content");
    const { data, app, name, error, errors, hasInitialState } = this.state
    const dataArray = data.split('/').filter(data => data.trim() != "")

    const handleSubmit = e => {
      e.preventDefault()
      let body = JSON.stringify({
        integration: {
          name: this.state.name,
          data: this.state.data,
          app: this.state.app
        }
      })
      fetch("api/v1/integrations", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
          "X-CSRF-TOKEN": token
        },
        body: body,
        credentials: "same-origin"
      })
        .then(response => {
          Turbolinks.visit("/integrations", { "action": "replace" })
        })
        .catch(function (error) {
          this.setState({ errors: error })
        })
    }

    const handleUpdateData = e => {
      this.setState({ data: e.target.value })
    }

    const handleUpdateName = e => {
      this.setState({ name: e.target.value })
    }

    const handleClear = e => {
      e.preventDefault()
      this.setState({ app: '', data: '', name: '', error: false })
    }

    const setDataType = () => {
      if (dataArray[2].includes("giving")) {
        this.setState({ app: "giving", error: false })
      } else if (dataArray[2] === "people") {
        this.setState({ app: "people", error: false })
      } else if (dataArray[5].includes("resources")) {
        this.setState({ app: "resources", error: false })
      } else {
        this.setState({ app: "", error: true })
      }
    }

    return (
      <div className="d-f fd-c">
        {app == "" && (
          <div className="mb-2">
            <div className="d-f fd-c mb-2">
              <label htmlFor="name" className="mb-4p">
                Integration Name
                  <span>Something you can reference later</span>
              </label>
              <input
                name="name"
                value={name}
                onChange={handleUpdateName}
                type="text"
              />
            </div>

            <div className="d-f fd-c">
              <label htmlFor="data" className="mb-4p">
                Integration Code
                  <span>Copy & paste a Giving/People form or Resources Widget here</span>
              </label>
              <textarea
                name="data"
                rows="8"
                cols="30"
                value={data}
                onChange={handleUpdateData}
              />

              {error && (
                <div className="alert alert--error mt-2">Invalid format</div>
              )}
            </div>

            <button
              onClick={setDataType}
              disabled={!data}
              className="mt-2 btn btn--primary"
            >
              Show Integration
  					</button>
          </div>
        )}

        {(app === 'giving' || app === 'people') && (
          <DisplayForm data={data} app={app} name={name} />
        )}

        {app === 'resources' && <DisplayWidget data={data} name={name} />}

        {(app != "" && !hasInitialState) && (
          <div>
            {errors && (
              <div className="d-f fd-c mb-2">
                <div className="alert alert--error mt-2">{errors}</div>
              </div>
            )}
            <div className="d-b mt-3">
              <button className="btn btn--primary mr-1" onClick={handleSubmit}>
                Save Integration
              </button>
              <button className="btn btn--secondary" onClick={handleClear}>
                Start Over
  						</button>
            </div>
          </div>
        )}
      </div>
    )
  }
}
