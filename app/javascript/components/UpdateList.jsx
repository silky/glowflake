import React, { useState, useEffect } from "react";
import Markdown from 'react-markdown'
import remarkGfm from 'remark-gfm'

export default () => {
  const [updates, setUpdates] = useState([]);

  useEffect(() => {
    const url = "api/v1/updates/all";
    fetch(url)
      .then( (result) => {
        if (result.ok) { return result.json(); }
        throw new Error("Error while getting update data");
      })
    .then(setUpdates);
  }, []);

  const theUpdates = updates.map((update, idx) => {
    const theTags = update.tags.map((tag, idx) => {
      const style = {
        "border-bottom-color": tag.colour,
        "border-bottom-width": "2px",
        "border-bottom-style": "solid"
      };
      return (
        <span className="tag" style={style}>
          {tag.name}
        </span>
      )
    });
    return (
      <div className="updateCard">
        <div className="meta">
          <div className="personImage">
            <img src={update.person.image} />
          </div>
          <div className="personName">
            {update.person.name}
          </div>
          <div className="date"
              title={update.created_at}
            >
            {update.created_ago}
          </div>
        </div>
        <div class="info">
          <div className="content">
            <Markdown remarkPlugins={[remarkGfm]}>{update.content}</Markdown>
          </div>
          <div className="tags">
            {theTags}
          </div>
        </div>
      </div>
    );
  });

  return (
    <div className="updateList">
      {theUpdates}
    </div>
  );
}
