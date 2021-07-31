import axios from 'axios';
import React from 'react';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  Brush,
} from 'recharts';

const rootpath = 'https://api.covid19api.com/total/dayone/country/singapore';

interface BasicGraphProps {}
type RawDataInterface = {
  Active: number;
  City: string;
  CityCode: string;
  Confirmed: number;
  Country: string;
  CountryCode: string;
  Date: string;
  Deaths: number;
  Lat: string;
  Lon: string;
  Province: string;
  Recovered: number;
};
type DataInterface = {
  date: string;
  active: number;
  confirmed: number;
  recovered: number;
};
export const BasicGraph: React.FC<BasicGraphProps> = () => {
  const [data, setData] = React.useState<Array<DataInterface>>();

  React.useEffect(() => {
    const init = async () => {
      axios.get(rootpath).then((resp) => {
        const raw: Array<RawDataInterface> = resp.data;
        const res: Array<DataInterface> = [];
        for (let i = 0; i < raw.length; i++) {
          let newDate = new Date(raw[i].Date);
          let newDateString: string = `${newDate.toLocaleString('default', {
            day: '2-digit',
          })} ${newDate.toLocaleString('default', {
            month: 'short',
          })} ${newDate.toLocaleString('default', { year: 'numeric' })}`;
          let tmp: DataInterface = {
            date: newDateString,
            active: i > 0 ? raw[i].Active - raw[i - 1].Active : raw[i].Active,
            confirmed: i > 0 ? raw[i].Confirmed - raw[i - 1].Confirmed : raw[i].Confirmed,
            recovered: i > 0 ? raw[i].Recovered - raw[i - 1].Recovered : raw[i].Recovered,
          };
          res.push(tmp);
        }
        setData(res);
      });
    };

    init();
  }, []);

  return (
    <div style={{ display: 'inline', float: 'none' }}>
      {data !== undefined && (
        <BarChart
          width={1000}
          height={300}
          data={data}
          margin={{
            top: 20,
            right: 30,
            left: 20,
            bottom: 5,
          }}
        >
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="date" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Brush
            dataKey="date"
            height={30}
            stroke="#8884d8"
            startIndex={data.length - 20}
            endIndex={data.length - 1}
          />
          <Bar dataKey="active" stackId="a" fill="#ff4a4a" />
          <Bar dataKey="confirmed" stackId="a" fill="#8884d8" />
          <Bar dataKey="recovered" stackId="a" fill="#82ca9d" />
        </BarChart>
      )}
    </div>
  );
};
