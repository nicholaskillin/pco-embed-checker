import React from "react"
import { Helmet } from "react-helmet"

import GivingBadge from "../../assets/images/giving.svg"

export default function DisplayForm(props) {
  const { data, app, name } = props
	const script = `https://js.churchcenter.com/modal/v1`
	const url = data.replace(/\s/g, '')

	return (
		<div className="integration-details">
			<Helmet
				script={[
					{
						type: 'text/javascript',
						src: script,
					},
				]}
			/>
      <div className="d-f ai-c jc-fs mb-2">
				
				<h2>{name}</h2>
			</div>

      <div className="d-f">
				<a
					href={url}
					data-open-in-church-center-modal="true"
					className="btn btn--primary mr-1"
				>
					Open modal
				</a>
				<a
					href={url}
					rel="noopener noreferrer"
					target="_blank"
					className="btn btn--primary"
				>
					Open new tab
				</a>
			</div>
		</div>
	)
}
