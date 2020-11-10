import axios from 'axios';
import instance from './instance';

export const getAllMilestones = async () => {
  const url = "/api/milestone"
  try{
    const result = await instance.get(url);
    const {milestoneArray} = result.data;
    return milestoneArray;
  } catch(error){
    console.error(error)
  }
};
