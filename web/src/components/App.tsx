import React, { useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";

import {
  Card,
  CardHeader,
  CardBody,
  CardFooter,
  Typography,
  Button,
} from "@material-tailwind/react";

type Reward = {};

type TimeUpdated = {
  time: number;
  rewardname: string;
  collectionable: string;
  cantcollect: string;
  itemname: string;
};

const App = (): React.ReactElement => {
  const [isGameMenuVisible, setIsGameMenuVisible] = useState<boolean>(false);
  const [rewardInfo, setRewardInfo] = useState<Reward>();
  const [countdown, setCountdown] = useState<TimeUpdated>();
  const [imageSrc, setImageSrc] = useState<string | null>(null);

  useNuiEvent("openGameMenu", (data: Reward): void => {
    setRewardInfo(data as Reward);
    setIsGameMenuVisible(true);
  });

  useNuiEvent("updateTime", (data: TimeUpdated): void => {
    setCountdown(data as TimeUpdated);
    setImageSrc(data.itemname);
  });

  return (
    <>
      {isGameMenuVisible && (
        <div className="flex items-end justify-end fixed bottom-0 right-0 p-4">
          <Card
            className="w-48 h-72 bg-gray-100 shadow-md"
            style={{
              backgroundColor: "rgba(41, 41, 41, 0.9)",
            }}
          >
            <CardHeader
              color="blue-gray"
              className="relative h-28 flex items-center justify-center"
              style={{
                backgroundColor: "rgba(41, 41, 41, 0.9)",
                boxShadow: "0 4px 6px rgba(0, 0, 0, 0.1)",
              }}
            >
             <img src={window.location.origin + '/web/build/images/'+ imageSrc + '.png'} />

            </CardHeader>
            <CardBody className="p-4">
              <Typography
                variant="h5"
                color="white"
                className="mb-2 text-white"
              >
                {!countdown ? "Bread" : countdown.rewardname}
              </Typography>
              <Typography className="text-white">
                {" "}
                Available in:{" "}
                {!countdown ? 60 : countdown.time < 0 ? 0 : countdown.time}
              </Typography>
            </CardBody>
            <CardFooter className="pt-0 px-4 pb-4">
              <Button>
                {!countdown
                  ? "Can't collect"
                  : countdown.time === 0
                  ? countdown.collectionable
                  : countdown.cantcollect || "Can't collect"}
              </Button>
            </CardFooter>
          </Card>
        </div>
      )}
    </>
  );
};

export default App;
