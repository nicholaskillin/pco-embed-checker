import React from "react"
import DisplayForm from "./display_form"
import DisplayWidget from "./display_widget"

export default class AddIntegrationForm extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      data: this.props.data || '',
      app: this.props.app || '',
      name: this.props.name || '',
      error: false,
      hasInitialState: false,
    }
  }

  componentDidMount() {
    if(this.props.name) {
      this.setState({ hasInitialState: true})
    }
  }

  render() {
    const token = $('meta[name="csrf-token"]').attr("content");
    const { data, app, name, error, hasInitialState } = this.state
    const dataArray = data.split('/')

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
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(function (error) {
          console.log(error)
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
      if (dataArray[dataArray.length - 1].includes("giving")) {
        this.setState({ app: "giving", error: false })
      } else if (dataArray[dataArray.length - 3] === "people") {
        this.setState({ app: "people", error: false })
      } else if (dataArray[dataArray.length - 4].includes("resources")) {
        this.setState({ app: "resources", error: false })
      } else {
        this.setState({ app: '', error: true })
      }
    }

    return (
      <div className="d-f fd-c p-2">
        <form onSubmit={handleSubmit}>
          {app == "" && (
            <div className="mb-2">
              <div className="d-f fd-c mb-2">
  							<label htmlFor="name" className="mb-4p">
  								Name
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
  								Paste Code Here
  							</label>
  							<textarea
  								name="data"
  								rows="8"
  								cols="30"
  								value={data}
  								onChange={handleUpdateData}
  							/>

  							{error && (
  								<div className="error mt-2 px-2 py-1 d-ib">invalid format</div>
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
            <button type="submit">Save</button>
          )}
        </form>
      </div>
    )
  }
}
