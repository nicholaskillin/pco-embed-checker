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
    }
  }
  render() {
		const { data, app, name, error } = this.state
		const dataArray = data.split('/')

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
			if (dataArray[dataArray.length - 1].includes('giving')) {
				this.setState({ app: 'giving', error: false })
			} else if (dataArray[dataArray.length - 3] === 'people') {
				this.setState({ app: 'people', error: false })
			} else if (dataArray[dataArray.length - 4].includes('resources')) {
				this.setState({ app: 'resources', error: false })
			} else {
				this.setState({ app: '', error: true })
			}
		}

		return (
			<div style={{ display: 'flex' }}>
				<div style={{ marginRight: 16 }}>
          <label>Name</label>
          <br />
          <input
            value={name}
            onChange={handleUpdateName}
            style={{display: "block", width: "100%"}}
          />
          <br />
          <label>Paste Code Here</label>
          <br />
					<textarea
						rows="8"
						cols="30"
						value={data}
						onChange={handleUpdateData}
					/>
					<br />
					<button
						onClick={setDataType}
						disabled={!data}
						style={{ marginTop: 10 }}
					>
						Submit
					</button>
					<button
						style={{ marginLeft: 8 }}
						onClick={handleClear}
						disabled={!data}
					>
						Clear
					</button>

					{error && (
						<div
							style={{
								marginTop: 10,
								padding: 8,
								border: '1px solid red',
								color: 'red',
								display: 'inline-block',
							}}
						>
							invalid format
						</div>
					)}
				</div>

				{(app === 'giving' || app === 'people') && (
					<DisplayForm data={data} app={app} name={name} />
				)}

				{app === 'resources' && <DisplayWidget data={data} name={name} />}
			</div>
		)
	}
}
