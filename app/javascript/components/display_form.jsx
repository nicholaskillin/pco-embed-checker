import React from "react"
import { Helmet } from "react-helmet"

export default function DisplayForm(props) {
  const { data, app, name } = props
	const script = `https://js.churchcenter.com/modal/v1`
	const url = data.replace(/\s/g, '')

	return (
		<div>
			<Helmet
				script={[
					{
						type: 'text/javascript',
						src: script,
					},
				]}
			/>
      <h2>{name}</h2>
      <p>({app})</p>
			<a href={url} data-open-in-church-center-modal="true">
				Open modal
			</a>
			<a
				href={url}
				rel="noopener noreferrer"
				target="_blank"
				style={{ marginLeft: 10 }}
			>
				Open new tab
			</a>
		</div>
	)
}
