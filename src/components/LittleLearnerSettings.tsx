import {
  LITTLE_LEARNER_LEVELS,
  LITTLE_LEARNER_TOPICS,
} from "../config/littleLearnerTopics";

import "./LittleLearnerSettings.css";


interface LittleLearnerSettingsProps {
  level:
    number;

  topic:
    string;

  subtopic:
    string;

  onChangeLevel:
    (
      value:
        number,
    ) => void;

  onChangeTopic:
    (
      topic:
        string,
      subtopic:
        string,
    ) => void;

  onClose:
    () => void;
}


export default function LittleLearnerSettings({
  level,
  topic,
  subtopic,
  onChangeLevel,
  onChangeTopic,
  onClose,
}: LittleLearnerSettingsProps) {
  const selectedTopic =
    LITTLE_LEARNER_TOPICS
      .find(
        (
          item,
        ) =>
          item.code ===
          topic,
      ) ??
    LITTLE_LEARNER_TOPICS[
      0
    ];

  return (
    <main
      className="little-settings"
    >
      <header
        className="little-settings__top"
      >
        <button
          type="button"
          aria-label="Close"
          onClick={
            onClose
          }
        >
          ←
        </button>

        <strong>
          Parent Settings
        </strong>

        <span />
      </header>


      <section>
        <h2>
          Level
        </h2>

        <div
          className="little-settings__levels"
        >
          {
            LITTLE_LEARNER_LEVELS.map(
              (
                item,
              ) => (
                <button
                  type="button"
                  key={
                    item.level
                  }
                  className={
                    item.level ===
                      level
                      ? "selected"
                      : ""
                  }
                  onClick={() =>
                    onChangeLevel(
                      item.level,
                    )
                  }
                >
                  <strong>
                    {
                      item.level
                    }
                  </strong>

                  <small>
                    {
                      item.name
                    }
                  </small>
                </button>
              ),
            )
          }
        </div>
      </section>


      <section>
        <h2>
          Topic
        </h2>

        <div
          className="little-settings__topics"
        >
          {
            LITTLE_LEARNER_TOPICS.map(
              (
                item,
              ) => (
                <button
                  type="button"
                  key={
                    item.code
                  }
                  className={
                    item.code ===
                      topic
                      ? "selected"
                      : ""
                  }
                  onClick={() =>
                    onChangeTopic(
                      item.code,
                      "",
                    )
                  }
                >
                  <span>
                    {
                      item.icon
                    }
                  </span>

                  <strong>
                    {
                      item.name
                    }
                  </strong>
                </button>
              ),
            )
          }
        </div>
      </section>


      {
        selectedTopic
          .subtopics
          .length >
          0 && (
          <section>
            <h2>
              Subtopic
            </h2>

            <div
              className="little-settings__subtopics"
            >
              <button
                type="button"
                className={
                  !subtopic
                    ? "selected"
                    : ""
                }
                onClick={() =>
                  onChangeTopic(
                    topic,
                    "",
                  )
                }
              >
                All
              </button>

              {
                selectedTopic
                  .subtopics
                  .map(
                    (
                      item,
                    ) => (
                      <button
                        type="button"
                        key={
                          item.code
                        }
                        className={
                          item.code ===
                            subtopic
                            ? "selected"
                            : ""
                        }
                        onClick={() =>
                          onChangeTopic(
                            topic,
                            item.code,
                          )
                        }
                      >
                        {
                          item.name
                        }
                      </button>
                    ),
                  )
              }
            </div>
          </section>
        )
      }


      <button
        type="button"
        className="little-settings__done"
        onClick={
          onClose
        }
      >
        Start
      </button>
    </main>
  );
}
