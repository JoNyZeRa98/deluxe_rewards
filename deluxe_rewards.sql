SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `deluxe_rewards` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `rewardcount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `deluxe_rewards`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `deluxe_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;