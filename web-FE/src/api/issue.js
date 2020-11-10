import axios from "axios";

const instance = axios.create({
  baseURL: 'http://101.101.217.148:8080',
  timeout: 1000,
  headers: {'Authorization': 'Bearer '+ process.env.TOKEN}
});

export const getAllIssues = async () => {
  const issueUrl = "/api/issue"
  try{
    const result = await instance.get(issueUrl);
    const {issueArr} = result.data;
    return issueArr;
  } catch(error){
    console.error(error)
  }
};
